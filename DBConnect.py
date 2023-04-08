import pymysql
from flask import Flask, request, render_template, url_for, session, redirect
app = Flask(__name__, static_url_path='')
app.secret_key = "nevergonnagiveyouup"

@app.route("/")
def index():
    return render_template('index.html')



@app.route("/western")
def western():
    return render_template('western.html')

@app.route("/chinese")
def chinese():
    return render_template('chinese.html')

@app.route("/thai")
def thai():
    return render_template('thai.html')

@app.route("/catergories")
def catergories():
    return render_template('catergories.html')

@app.route("/order")
def order():
    db = pymysql.connect(host="localhost", user="user",passwd="123", database="PlateMate")
    cursor = db.cursor()

    sql=("SELECT DISTINCT category FROM restaurant ")
    cursor.execute(sql)

    catergories = cursor.fetchall()
    return render_template('order.html', catergories=catergories)


@app.route("/about")
def about():
    return render_template('about.html')

@app.route("/signin")
def singin():
    return render_template('signin.html')

@app.route("/register")
def register():
    return render_template('register.html')

@app.route("/vieworder")
def vieworder():
    db = pymysql.connect(host="localhost", user="user",passwd="123", database="PlateMate")
    cursor = db.cursor()

    sql=("SELECT Porder.order_id, Porder.restaurant_id, restaurant.name, Porder.foodname FROM Porder  INNER JOIN restaurant On Porder.restaurant_id = restaurant.restaurant_id WHERE member_id = "+str(session['member_id']))
    cursor.execute(sql)

    foods = cursor.fetchall()
    return render_template('vieworder.html', foods=foods)

@app.route("/spicygrove")
def spicygrove():
    db = pymysql.connect(host="localhost", user="user",passwd="123", database="PlateMate")
    cursor = db.cursor()

    sql=("SELECT * FROM food WHERE restaurant_id = 1")
    cursor.execute(sql)

    foods = cursor.fetchall()
    return render_template('spicygrove.html', foods=foods)

@app.route("/thegoldenchopsticks")
def thegoldenchopsticks():
    db = pymysql.connect(host="localhost", user="user",passwd="123", database="PlateMate")
    cursor = db.cursor()

    sql=("SELECT * FROM food WHERE restaurant_id = 2")
    cursor.execute(sql)

    foods = cursor.fetchall()
    return render_template('thegoldenchopsticks.html', foods=foods)

@app.route("/smokehousegrill")
def smokehousegrill():
    db = pymysql.connect(host="localhost", user="user",passwd="123", database="PlateMate")
    cursor = db.cursor()

    sql=("SELECT * FROM food WHERE restaurant_id = 3")
    cursor.execute(sql)

    foods = cursor.fetchall()
    return render_template('smokehousegrill.html', foods=foods)

@app.route("/gardentable")
def gardentable():
    db = pymysql.connect(host="localhost", user="user",passwd="123", database="PlateMate")
    cursor = db.cursor()

    sql=("SELECT * FROM food WHERE restaurant_id = 4")
    cursor.execute(sql)

    foods = cursor.fetchall()
    return render_template('gardentable.html', foods=foods)

@app.route("/coastalcatch")
def coastalcatch():
    db = pymysql.connect(host="localhost", user="user",passwd="123", database="PlateMate")
    cursor = db.cursor()

    sql=("SELECT * FROM food WHERE restaurant_id = 5")
    cursor.execute(sql)

    foods = cursor.fetchall()
    return render_template('coastalcatch.html', foods=foods)

@app.route("/sweettoothcafe")
def sweettoothcafe():
    db = pymysql.connect(host="localhost", user="user",passwd="123", database="PlateMate")
    cursor = db.cursor()

    sql=("SELECT * FROM food WHERE restaurant_id = 6")
    cursor.execute(sql)

    foods = cursor.fetchall()
    return render_template('sweettoothcafe.html', foods=foods)















@app.route("/register", methods=['POST'])
def register_post():
    

    db = pymysql.connect(host="localhost", user="user",passwd="123", database="PlateMate")
    cursor = db.cursor()
    username = request.form['username']
    password = request.form['password']
    user_address = request.form['user_address']
    email_address = request.form['email_address']

    sql = "INSERT INTO user (username, password, user_address, email_address) VALUES ('%s','%s', '%s', '%s')" % (username, password, user_address,email_address)
    
    try:
        cursor.execute(sql)
        db.commit()
        return "Register success!" + '<br>' + "<a href = '/'>Click Here to back to home page</a>"
    except:
        db.rollback()
        db.close()
        return "Register failed!" + '<br>' + "<a href = '/'>Click Here to back to home page</a>"
    
@app.route("/signin", methods=['POST', 'GET'])
def signin():
    error = None
    if request.method == 'POST':
        username = request.form["username"]
        password = request.form['password']
        

        db = pymysql.connect(host="localhost", user="user",passwd="123", database="PlateMate")
        cursor = db.cursor()

        sql = ("SELECT member_id, username, password FROM user WHERE username = '"+username+"' and password = '"+password+"'")
        cursor.execute(sql)

        db.commit()
        results =cursor.fetchall()
        for row in results:
            member_id = row[0]
            username = row[1]
            password = row[2]
            
            session['member_id'] = member_id
            session['username'] = username
            return redirect(url_for('index'))

        



 

@app.route("/submit_order", methods=["POST"])
def submit():
    

    db = pymysql.connect(host="localhost", user="user",passwd="123", database="PlateMate")
    cursor = db.cursor()
    restaurant_id = request.form['restaurant_id']
    member_id = request.form['member_id']
    selection = request.form.get("selection")

    sql = "INSERT INTO Porder (restaurant_id, member_id, foodname) VALUES ('%s','%s', '%s')" % (restaurant_id, member_id, selection)
    
    try:
        cursor.execute(sql)
        db.commit()
        return f"Order successful!" + '<br>' + "<a href = '/'>Press the this link if paid</a>"
    except:
        db.rollback()
        db.close()
        return "Order failed!"






@app.route("/signout")
def signout():
    session.pop('member_id',None)
    return 'You have sign out, please close this window!' +  '<br>' + "<a href = '/'>Click Here to back to home page</a>"


@app.route("/check_username", methods=["POST"])
def check_username():
    db = pymysql.connect(host="localhost", user="user",passwd="123", database="PlateMate")
    cursor = db.cursor()

    username = request.form.get('username')
    sql = "SELECT COUNT(*) FROM user WHERE username='"+str(username)+"'"

    #try:
    cursor.execute(sql)
    result =cursor.fetchall()
    #except:
    #    db.close()
    #    return "DB error"
    

    if len(username) < 1:
        return "Username is empty"
    if  result[0][0] > 0:
        return "Username is occupied"
    else:
        return "ok"
        

        

















if __name__ == "__main__":
    app.run(debug=True)