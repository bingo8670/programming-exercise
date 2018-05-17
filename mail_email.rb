# 请事先安装好 mail 库: gem install mail
require 'mail'

Mail.defaults do
  delivery_method :smtp, {  :address   => "smtp.163.com",
                            :port      => 25,
                            :user_name => "username@163.com",
                            :password  => "******",
                            :enable_starttls_auto => false,
                            :openssl_verify_mode => 'none' }
  retriever_method :pop3, { :address    => "pop.163.com",
                            :port       => 995,
                            :user_name  => "username@163.com",
                            :password   => "******",
                            :enable_ssl => true }
end

# mail = Mail.deliver do
#   to      '12312312@qq.com'
#   from    'username@163.com'
#   subject '测试文件，勿回'
#   text_part do
#     body 'Testing mail 测试文件，勿回 测试文件，勿回 测试文件，勿回'
#   end
# end

p Mail.last
