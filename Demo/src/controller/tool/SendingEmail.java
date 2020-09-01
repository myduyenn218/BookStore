package controller.tool;


import java.util.Properties;
import javax.mail.*;
import javax.mail.PasswordAuthentication;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendingEmail extends Thread {
    private String userEmail;
    private String myHash;
    private String servletName;

    @Override
    public void run() {
        sendMail();
    }

    public SendingEmail(String servletName, String userEmail, String myHash) {
        this.userEmail = userEmail;
        this.myHash = myHash;
        this.servletName = servletName;
    }

    private void sendMail() {
        final String email = "nvtanh4vipm@gmail.com";
        final String password = "vipmember";

        Properties props = new Properties();

        props.put("mail.smtp.host", "smtp.gmail.com");
        // below mentioned mail.smtp.port is optional
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getDefaultInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(email, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(this.userEmail));
            message.setSubject("Email Verification Link");
            message.setText("Click this link to confirm your email address and complete setup for your account.\n\nVerification Link: http://localhost:8080/" + servletName + "?key1=" + this.userEmail + "&key2=" + this.myHash);
            Transport.send(message);
        } catch (Exception var6) {
            System.out.println("Error at SendingEmail.java: " + var6);
        }
    }

}
