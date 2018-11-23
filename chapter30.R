#SEND EMAIL FROM R
install.packages("mailR")
library(mailR)
send.mail(from="shirisharaghunath293@gmail.com",
          to="shirisharaghunath293.sg@gmail.com",
          subject="Test Email",
          body="PFA the desired document",
          html=T,
          smtp=list(host.name = "smtp.gmail.com",
                    port = 465,
                    user.name = "shirisharaghunath293@gmail.com",
                    passwd = "",
                    ssl = T),
          authenticate=T,
          attach.files="C:\\groups.csv")

#You can add multiple recipients including the following code.
to = c("Recipient 1 <sairoyal70@gmail.com>", "ushapeddineni@gmail.com"),
cc = c("CC Recipient <cc.recipient@gmail.com>"),
bcc = c("BCC Recipient <bcc.recipient@gmail.com>")