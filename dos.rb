load 'programmes/binary.rb'
@userInfo = File.open("loggedin.txt", "w+")
help = File.open("help.txt", "r+")
require 'net/http'
#require 'paint'
cmd = String.new
if help.read == "no" then
    puts "Welcome back #{@userInfo.read}"
else
    puts "Hello and welcome to JeiDos. Start by typing in 'help"
end

while cmd != "exit"

print ":"
cmd = gets.chomp!

# Variables and Methods
@time = Time.now

@version = "Alpha 0.3.5.1\nLast Updated: 11.02.2015"

@commandList = "ls, exit, open, download, time, calc, version, convert, login, password, crt-usr, users, clear,  ?:, :"
@help = {'ls' => 'Lists all the files and folder in your current directory',
                 'exit' => 'exits the programme',
                 'rm' => 'Can delete files. Type in rm and you will get a "?:". It is asking you for the file to delete',
                 'open' => 'Can open files. Type in open and you will get a "?:". It is asking you for the file to open',
                 'download' => 'Can be used to download files from a webserver (works only on Linux). New: Added Ruby-Downloader, downloading now works on other platforms too',
                 'time' => 'Will show the current time for UTC+1',
                 'calc' => 'This is a very basic calculator',
                 'version' => 'This will tell you the current version of the programme',
                 'convert' => 'This programme can be used to convert Latin characters to binary code. After entering "convert", you will see "?:". It wants Latin characters',
                 '?:' => 'This symbol is indacting that the programme is asking. It is asking you to type in something',
                 ':' => 'This is the normal command prompt. You can just enter an command when you see this',
                 'crt-usr' => "This command will allow you to create a new user. The user will get its own file with the name 'user'.user\nThen close the dos.rb file and open the .rb and the .user files with your name. Please remove everything from the .user file and replace it with your new password. You can now open the .rb file and enter a few commands. Then open the dos.rb again and login",
                 'login' => "This commands lets you login and start your personal page. You need an account for that. You can create one with crt-usr. After you created it (look for help for crt-usr, please), you can type in login. Type your username and password in and you will be able to see your personal page",
                 'password' => "Generates a random eight character long password",
                 'users' => "This will show you all the registered",
                 'clear' => "This will clean your screen"
                 
                }
                
@@pwFiles = [",", ".", "?", "A", "B", "C", "D", "E", ")", "(", "#", "!", "%", "&", "$", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-", ">", "<", "a", "u", "o", "+", "m", "z", "=", "_"]

def blue(text)
    puts "\e[34m#{text}\e[0m"
end
 
def red(text)
    puts "\e[31m#{text}\e[0m"
end
 
def green(text)
    puts "\e[32m#{text}\e[0m"
end
 
def orange(text)
    puts "\e[33m#{text}\e[0m"
end

def showFiles(folder)
    files = Dir.entries("#{folder}")
    files.to_a
    if files.include? (".") then
        files.delete(".")
        files.delete("..")
        files.to_s
    end
    return files
end

def clear
    100.times do 
        puts
    end
end

def openFile(file)
    filevar = File.open("#{file}", "r")
    return filevar.read
end

def writeToFile(file, line1, line2, line3)
    filevar = File.open("#{file}", "w+")
    filevar.puts(line1)
    filevar.puts(line2)
    filevar.puts(line3)
end

def deleteFile(file)
    File.delete(file)
end

def detect_users(folder)
    @accepted = [".user"]
    @user = ""
    entries = Dir.entries(folder)
    entries.to_a
    entries.each do |entry|
        if @accepted.include? (File.extname(entry)) then
            @user << entry
            @user << "\n"
        end
    end
    return @user
end

def user_exist?(user)
    @accepted = [".user"]
    @@user = ""
    entries = Dir.entries("user")
    entries.to_a
    entries.each do |entry|
        if @accepted.include? (File.extname(entry)) then
            @@user << entry
        end
    end
    return @@user.include? (user)
end

def login(user, pass)
    value = String.new
    pw = File.open("user/#{user}", "r")
    return pw.read == pass
end


def loggedin(user)
    puts "Opening #{user}.rb"
    puts
    load "#{user}.rb"
end

def gen_pw
    $password = String.new
    8.times do
        password = @@pwFiles[rand(@@pwFiles.size)]
        $password << password
    end
    return $password
end



#

##Programmes
def calculator(num1, num2, operator)
    case operator
        when "+"
            puts "#{num1} + #{num2} = #{num1 + num2}"
        when "-"
            puts "#{num1} - #{num2} = #{num1 - num2}"
        when "*"
            puts "#{num1} * #{num2} = #{num1 * num2}"
        when "/"
            puts "#{num1} / #{num2} = #{num1 / num2}"
    end
end

def dl_lx(address, site)
    %x(wget #{address}/#{site})
    puts "Download complete"
end

def dl_rb(site, file)
    Net::HTTP.start("#{site}") do |http|
    resp = http.get("/#{file}")
    open("#{file}", "wb") do |file|
        file.write(resp.body)
    end
    puts "Download complete"
end
end

#- Binary convert programme - binary.rb


##

case cmd
when "ls"
puts showFiles(Dir.pwd)

when "open"
print "?:"
openD = gets.chomp!
puts openFile(openD)

when "clear"
clear

when "exit"
orange "Exiting dos.rb"

when "time"
puts "#{@time.hour + 1}:#{@time.min}:#{@time.sec}"

when "calc"
print "Num1: "
num1 = gets.chomp.to_f
puts
print "+,-,*,/ : "
operator = gets.chomp!
puts
print "Num2: "
num2 = gets.chomp.to_f
calculator(num1, num2, operator)

when "download"
puts "Which Download method?"
puts "1.) Use Ruby to download"
puts "2.) Use Linux to download (wget)"
print "Select (1,2): "
sel = gets.chomp.to_i
print "Site: "
site = gets.chomp!
puts
print "File: "
file = gets.chomp!

if sel == 1 then
    dl_lx(site, file)
end

if sel == 2 then
    dl_rb(site, file)
end
when "rm"
print "?:"
delete = gets.chomp!
deleteFile(delete)
red("#{delete} has been deleted")

when "version"
blue(@version)

when "convert"
print "?:"
convertString = gets.chomp!
puts convToBinary(convertString)

when "commands"
puts @help

when "help"
puts @commandList.to_s
print "Which command or symbol do you need help with: "
commandHelp = gets.chomp!
blue(@help[commandHelp])

when "crt-usr"
blue("--User creation--")
print "Enter username: "
@username = gets.chomp!
pw = gen_pw
File.new("user/#{@username}.user", "w+")
user = File.open("user/#{@username}.user", "w+")
start = File.new("#{@username}.rb", "w+")
start.puts('puts "Hello :)"')
pw = pw.delete("\n")
user.puts(pw)
orange "Username has been created... Press enter to continue"
gets
red("Shutting down^")
exit

when "users"
puts "Users registered:" 
puts detect_users("user")

when "login"
puts detect_users("user")
print "User: "
user = gets.chomp!
$user = user
user = "#{user}" + ".user"
if user_exist?(user) == true then
    print "Password: "
    password = gets.chomp!
    exit if password == ""
    if login(user, password) == true then
        puts "Hello #{user}"
        loggedin($user)
    else
        red("Wrong password!")
    end
else 
    red("Username does not exist!")
end

when "password"
puts gen_pw

when ""
puts "I bet your pardon?"

end
end
