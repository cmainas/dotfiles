unmailboxes *
set imap_user = "el13908@mail.ntua.gr"
set smtp_url = "smtp://el13908@smtp.ntua.gr"
set realname = "Charalampos Mainas"
set folder = "imaps://mail.ntua.gr"
set spoolfile = "+INBOX"
set postponed = "+INBOX.Drafts"
set record = "+INBOX.sent-mail"
set trash = "+INBOX.Trash"
##set spoolfile = "imaps://el13908@mail.ntua.gr/INBOX"
##set postponed = "imaps://el13908@mail.ntua.gr/INBOX.Drafts"
##set record = "imaps://el13908@mail.ntua.gr/INBOX.sent-mail"
set header_cache = ~/.mutt/com.gmail.el13908/cache/headers
set message_cachedir = ~/.mutt/com.gmail.el13908/cache/bodies
set certificate_file = ~/.mutt/com.gmail.el13908/certificates
set from = "el13908@mail.ntua.gr"
set ssl_starttls = yes
set ssl_force_tls = yes
bind editor <space> noop
macro index gi "<change-folder>=INBOX<enter>" "Go to inbox"
macro index gd "<change-folder>=INBOX.Drafts<enter>" "Go to drafts"
macro index gr "<change-folder>=INBOX.sent-mail<enter>" "Go to sent mails"
macro index gt "<change-folder>=INBOX.Trash<enter>" "Go to trash mails"


