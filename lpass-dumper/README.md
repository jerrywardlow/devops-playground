# LastPass backup

Dumps all LastPass entires that a user has access to. Requires the LastPass CLI
tool `lpass`, which can be found [here](https://github.com/lastpass/lastpass-cli),
and requires that the user is logged in to their account via said tool. All
entries are dumped to `./output/lpassdump.txt` in plaintext.

```
user@laptop $ ./lpass_scrape.sh
LastPass dump complete.
user@laptop $ less output/lpassdump.txt
#------------------------------------------------#
AWS Console - Contoso Ltd. - Deploy [id: 12341234123412341234]
Username: foo
Password: bar
URL: https://contosoltd.amazon.com/console
account: contosoltd
username: foo
password: bar
Notes: Contoso Ltd. Amazon Web Services Account 
#------------------------------------------------#
...
```
