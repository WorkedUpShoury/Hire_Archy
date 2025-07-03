package com.jobportal.util;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class EmailUtil {
    private static final String SMTP_HOST = "smtp.yourdomain.com";
    private static final String SMTP_PORT = "587";
    private static final String SMTP_USER = "noreply@yourdomain.com";
    private static final String SMTP_PASSWORD = "yourpassword";
    private static final String FROM_EMAIL = "noreply@jobportal.com";
    private static final String FROM_NAME = "JobPortal Notification";

    public boolean sendOfferEmail(String fromEmail, String toEmail, String subject, String message,
                                  String employerName, String companyName) {
        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SMTP_USER, SMTP_PASSWORD);
            }
        });

        try {
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(FROM_EMAIL, FROM_NAME));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            msg.setSubject(subject);

            String htmlContent = "<html><body>" +
                    "<h2 style='color: #4F46E5;'>Job Offer from " + companyName + "</h2>" +
                    "<p><strong>From:</strong> " + employerName + " (" + fromEmail + ")</p>" +
                    "<div style='border-left: 4px solid #4F46E5; padding-left: 15px; margin: 20px 0;'>" +
                    message.replace("\n", "<br>") +
                    "</div>" +
                    "<p>Please log in to your JobPortal account to respond to this offer.</p>" +
                    "<p>Best regards,<br>The JobPortal Team</p>" +
                    "</body></html>";

            msg.setContent(htmlContent, "text/html");

            Transport.send(msg);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
