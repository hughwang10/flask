import random, os
from flask import Flask, render_template

app = Flask(__name__)

def make_tree(path):
    tree = dict(name=path, children=[])
    try: lst = os.listdir(path)
    except OSError:
        pass #ignore errors
    else:
        for name in lst:
            fn = os.path.join(path, name)
            if os.path.isdir(fn):
                tree['children'].append(make_tree(fn))
            else:
                tree['children'].append(dict(name=fn))
    return tree

@app.route('/')
def index():
    dir_list = make_tree("/data")
    return render_template('index.html', text=dir_list)


if __name__ == "__main__":
    app.run(host="0.0.0.0")
    