function tools_alertmail(message)
    if ~exist('message','var')
        message = '';
    end
    
    mail = 'neuronoodle@gmail.com'; %Your GMail email address
    password = 'braindead'; %Your GMail password
    setpref('Internet','SMTP_Server','smtp.gmail.com');
    setpref('Internet','E_mail',mail);
    setpref('Internet','SMTP_Username',mail);
    setpref('Internet','SMTP_Password',password);
    props = java.lang.System.getProperties;
    props.setProperty('mail.smtp.auth','true');
    props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
    props.setProperty('mail.smtp.socketFactory.port','465');
    sendmail(mail,['[jan][participants] ',message])
end
