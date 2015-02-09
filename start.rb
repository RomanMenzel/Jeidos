if Dir.exists?('user') then
    Dir.mkdir('user')
end

entrs = Dir.entries(Dir.pwd)
if entrs.include? ("help.txt") == false then
    helpFile = File.new("help.txt", "w+")
    helpFile.puts("yes")
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


puts "1.) Create username"
puts "2.) Login"
sel = gets.chomp.to_i

case sel
when 1
print "Enter username: "
@username = gets.chomp!
pw = gen_pw
File.new("user/#{@username}.user", "w+")
user = File.open("user/#{@username}.user", "w+")
start = File.new("#{@username}.rb", "w+")
start.puts('puts "Hello :)"')
pw = pw.delete("\n")
user.puts(pw)
puts "Username has been created... Press enter to continue"
gets
puts "Shutting down"
exit

when 2
print "User:"
$username = gets.chomp!
$username = $username + ".user" 
if user_exist?($username) == true then
    print "Password: "
    $password = gets.chomp!
    if login($username, $password) == true then
        puts "Logging in..."
        puts "Logged in as #{$username}"
        puts "Starting dos.rb"
        puts "------"
        load 'dos.rb'
    else
        puts "Wrong password"
        exit
    end
else
    puts "User does not exist"
    exit
end
