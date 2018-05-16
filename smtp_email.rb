# SMTP(Simple Mail Transfer Protocol),即简单邮件传输协议,它是一组用于由源地址到目的地址传送邮件的规则，由它来控制信件的中转方式。
# username 替换为自己的邮箱用户名，****** 替换为自己的邮箱密码；

require 'net/smtp'

message = <<MESSAGE_END
From: Private Person <username@163.com>
To: A Test User <307286130@qq.com>
Subject: SMTP e-mail test

This is a test e-mail message.
MESSAGE_END

Net::SMTP.start('smtp.163.com',
                25,
                'localhost',
                'username', '******', :plain)  do |smtp|
  smtp.send_message message, 'username@163.com',
                             '307286130@qq.com'
end
