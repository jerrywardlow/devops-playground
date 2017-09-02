sitemap_crawler() {
    wget $1 --no-cache --output-document - | \
    egrep -o "https?://[^<]+" | \
    egrep -v ".png$|.jpg$|.gif$" | \
    while read -r link; do
        time curl --write-out "\n%{url_effective} -> %{http_code}" --user-agent 'Robo Warmer' --silent --location "$link" --output /dev/null
    done
}
