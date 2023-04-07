import pymysql
from flask import Flask, request, render_template, url_for
app = Flask(__name__)



@app.route("/")
def index():
    return render_template('index.html')

@app.route("/register", methods=['POST'])
def register():
    

    db = pymysql.connect(host="localhost", user="user",passwd="123", database="PlateMate")
    cursor = db.cursor()
    username = request.form['username']
    password = request.form['password']
    user_address = request.form['user_address']
    email_address = request.form['email_address']

    sql = "INSERT INTO USER (username, password, user_address, email_address) VALUES ('%s','%d', '%s', '%s')" % (username, password, user_address,email_address)
    
    try:
        cursor.execute(sql)
        db.commit()
    except:
        db.rollback()
        db.close()
















if __name__ == "__main__":
    app.run()