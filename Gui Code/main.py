import subprocess
from flask import Flask, jsonify, request, make_response

# Flask constructor takes the name of 
# current module (__name__) as argument.
app = Flask(__name__)

# The route() function of the Flask class is a decorator, 
# which tells the application which URL should call 
# the associated function.
@app.route('/', methods=['POST'])
# ‘/’ URL is bound with hello_world() function.
def hello_world():
    data = request.get_json()
    print(data)
    lines = data.get("lines")
    with open("someFile.py", 'w') as file:
        for line in lines:
            file.write(line + "\n")
    with open("run.bat", 'w') as file:
        file.writelines(["python3 someFile.py \n", "pause \n","exit"])
    subprocess.call('start run.bat', shell=True)
    return make_response('platform does not exist', 404)

# main driver function
if __name__ == '__main__':

    # run() method of Flask class runs the application 
    # on the local development server.
    app.run()
# from tkinter import *

# def drag_start(event):
#     widget = event.widget
#     widget.startX = event.x
#     widget.startY = event.y

# def drag_motion(event):
#     widget = event.widget
#     x = widget.winfo_x() - widget.startX + event.x
#     y = widget.winfo_y() - widget.startY + event.y
#     widget.place(x=x,y=y)

# window = Tk()

# label = Label(window,bg="red",width=10,height=5)
# label.place(x=0,y=0)

# label2 = Label(window,bg="blue",width=10,height=5, text="print")
# label2.place(x=100,y=100)

# label.bind("<Button-1>",drag_start)
# label.bind("<B1-Motion>",drag_motion)

# label2.bind("<Button-1>",drag_start)
# label2.bind("<B1-Motion>",drag_motion)

# window.mainloop()

