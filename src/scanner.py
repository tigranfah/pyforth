def get_next_token(file):
    token = ""
    while True:
        c = file.read(1).decode("utf-8")
        if c == "" and token != "":
            return token
        elif c == "":
            return None

        if c == " " or c == "\n":
            if token == "":
                continue
            else:
                break
        token += c

    return token