unmailboxes *
set imap_user = "elxxxxx@mail.ntua.gr"
set smtp_url = "smtp://elxxxxx@smtp.ntua.gr"
set realname = "Charalampos Mainas"
set folder = "imaps://mail.ntua.gr"
set spoolfile = "+INBOX"
set postponed = "+INBOX.Drafts"
set record = "+INBOX.sent-mail"
##set spoolfile = "imaps://elxxxxx@mail.ntua.gr/INBOX"
##set postponed = "imaps://elxxxxx@mail.ntua.gr/INBOX.Drafts"
##set record = "imaps://elxxxxx@mail.ntua.gr/INBOX.sent-mail"
set header_cache = ~/.mutt/com.gmail.elxxxxx/cache/headers
set message_cachedir = ~/.mutt/com.gmail.elxxxxx/cache/bodies
set certificate_file = ~/.mutt/com.gmail.elxxxxx/certificates
set from = "elxxxxx@mail.ntua.gr"
set ssl_starttls = yes
set ssl_force_tls = yes
bind editor <space> noop
macro index gi "<change-folder>=INBOX<enter>" "Go to inbox"
macro index gd "<change-folder>=INBOX.Drafts<enter>" "Go to drafts"
macro index gr "<change-folder>=INBOX.sent-mail<enter>" "Go to sent mails"


