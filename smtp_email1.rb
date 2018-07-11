# 加入Git忽视文件
# SMTP(Simple Mail Transfer Protocol),即简单邮件传输协议,它是一组用于由源地址到目的地址传送邮件的规则，由它来控制信件的中转方式。

require 'net/smtp'

FROM_ADDRESS = "18535150344@163.com"

def send(to, subject, msg)
  mail = ( "To: #{to}\r\n" +
  "From: #{FROM_ADDRESS}\r\n" +
  "Subject: #{subject}\r\n" +
  "\r\n" +
  msg )

  Net::SMTP.start('smtp.163.com',
                  25,
                  'localhost',
                  '1811111111', '123123Aa', :plain) do |smtp|
  smtp.send_mail(mail, FROM_ADDRESS,
  [ to, '307286130@qq.com' ])
  end
end

send("307286130",)
