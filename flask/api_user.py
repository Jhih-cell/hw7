
from flask import Flask, session, redirect, request, render_template, jsonify
import mysql.connector

mydb = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="*********************",
    database="website"
)

app = Flask(__name__,
            static_folder="public",
            static_url_path="/"
            )

app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'

# 首頁路由


@app.route("/")
def index():
    return render_template("index.html")

# 註冊路由


@app.route("/signup", methods=["POST"])
def signup():
    name = request.form["name"]
    username = request.form["username"]
    password = request.form["password"]
    mycursor = mydb.cursor()

    # 先檢查使用者是否有填入完整資訊
    if name and username and password != "":

        sql = "SELECT username FROM user where username=%s"
        val = (username,)
        mycursor.execute(sql, val)
        result_count = len(mycursor.fetchall())

        if result_count >= 1:
            return redirect("/error/?message=帳號已經被註冊")
        else:

            sql = "INSERT INTO user (name,username,password) VALUES (%s, %s, %s)"
            val = (name, username, password)
            mycursor.execute(sql, val)
            mydb.commit()
            return redirect("/")
    return redirect("/error/?message=請填入完整註冊資訊")

# 登入驗證功能的路由


@app.route("/signin", methods=["POST"])
def signin():
    username = request.form["username"]
    password = request.form["password"]
    mycursor = mydb.cursor()
    sql = "SELECT id FROM user WHERE username=%s and password=%s"
    val = (username, password)
    mycursor.execute(sql, val)
    result = mycursor.fetchall()
    # 先檢查使用者是否有填入帳密
    if username and password != "":
        # 判斷是否有找到符合條件的帳密
        if result == []:
            # 驗證失敗，將使用者導向到【驗證失敗的路由】
            return redirect("/error/?message=帳號或密碼輸入錯誤")
        else:
            # 先把使用者姓名帶出來
            mycursor = mydb.cursor()
            sql = "SELECT name FROM user WHERE username=%s"
            val = (username,)
            mycursor.execute(sql, val)
            name = mycursor.fetchall()
            strname = str(name)
            name = strname[3:len(strname)-4]
            # 將使用者姓名加入 session 中紀錄
            session['username'] = name
            # 並導向【成功登入路由】
            return redirect("/member/")
    else:
        return redirect("/error/?message=請輸入完整的帳號與密碼")


# 成功登入的路由


@app.route("/member/")
def member():
    # 檢查使用者狀態
    if 'username' in session:
        name = session['username']
        # 驗證成功，將使用者導向到【成功頁面網址】
        return render_template("member.html", data=name)
    # 在後端Session 中記錄使用者狀態為未登入，並導向【首頁】
    return redirect("/")

# 查詢會員姓名 API


@app.route("/api/users")
def api():
    username = request.args.get('username')
    mycursor = mydb.cursor()
    # 取出id
    sql = "SELECT id FROM user WHERE username=%s"
    val = (username, )
    mycursor.execute(sql, val)
    id = mycursor.fetchall()
    id = str(id)[2:len(id)-4]
    # 取出使用者姓名
    sql = "SELECT name FROM user WHERE username=%s"
    val = (username,)
    mycursor.execute(sql, val)
    name = mycursor.fetchall()
    name = str(name)[3:len(name)-5]
    successmessage = {
        "data": {
            "id": id,
            "name": name,
            "username": username
        }
    }
    failmessage = {
        "data": None
    }

    if successmessage["data"]["name"] != "":
        return jsonify(successmessage)
    else:
        return jsonify(failmessage)


# 驗證失敗的路由


@app.route("/error/")
def error():
    message = request.args.get("message", "帳號或密碼輸入錯誤")
    return render_template("error.html", data=message)

# 登出狀態的路由


@app.route('/signout')
def signout():
    # 連線到【登出功能網址】，在後端Session 中記錄使用者狀態為未登入
    session.pop('username', None)
    # 並導向【首頁】
    return redirect('/')


app.run(port=3000)
