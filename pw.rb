#Password generator

pwFiles = [",", ".", "?", "A", "B", "C", "D", "E", ")", "(", "#", "!", "%", "&", "$", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-", ">", "<", "a", "u", "o", "+", "m", "z", "=", "_"]

def gen_pw
    $password = String.new
    8.times do
        password = pwFiles[rand(pwFiles.size)]
        $password << password
    end
    return $password
end
