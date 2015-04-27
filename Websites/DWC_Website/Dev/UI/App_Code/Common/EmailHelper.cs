using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;


namespace Cricket
{
    public static class EmailHelper
    {
        public static void SendEmail(string teamName, string subject, string message, string toAddress)
        {
            string fromAddress = "dcl_webmaster@dallascricket.net";
            try
            {
                MailMessage msg = new MailMessage(new MailAddress(fromAddress), new MailAddress(toAddress));
                msg.Body = message;
                msg.IsBodyHtml = false;
                msg.Subject = subject;
                msg.Priority = MailPriority.Normal;
                SmtpClient client = new SmtpClient();
                client.Send(msg);
            }
            catch
            {
            }
        }

        private static void SendEmailRegistration(string teamName, string toAddress)
        {
            try
            {
                //string message = string.Format("This email is to confirm that we have received registration entry for your team {0} to participate in the {1}{2}{2}, Your registration is not final until you pay the regsiration fees on the website.", teamName, tournamentName, Environment.NewLine);
                //MailMessage msg = new MailMessage();
                //msg.Body = message;
                //msg.From = "ziaq@dallascricket.net";
                //msg.Bcc = "ziaq@dallascricket.net";
                //msg.BodyFormat = MailFormat.Text;
                //msg.Subject = string.Format("DCL: Registration confirmation for {0}", teamName);
                //msg.Priority = MailPriority.Normal;
                //msg.To = toAddress;
                //SmtpMail.Send(msg);
            }
            catch
            {
            }
        }
		
		

    }
}