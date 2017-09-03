sitemap_crawler() {
    wget $1 --no-cache --output-document - | \
    egrep -o "https?://[^<]+" | \
    egrep -v ".png$|.jpg$|.gif$" | \
    while read -r link; do
        time curl --write-out "\n%{url_effective} -> %{http_code}" --user-agent 'Robo Warmer' --silent --location "$link" --output /dev/null
    done
}

robo_reader() {
    wget -q $1 --no-cache --output-document - | \
    grep -i "sitemap" | \
    egrep -o "https?://.*" | \
    while read -r sitemap; do
		sitemap_log="/tmp/robo_warmer.$(echo $sitemap | shasum | cut -f1 -d " ").log"
		echo "Logging $sitemap into $sitemap_log"	
        sitemap_crawler $sitemap > $sitemap_log 2>&1 &
    done

	echo "Robo warmer is doing the only thing he knows how to do!"
}

robo_reader $1
