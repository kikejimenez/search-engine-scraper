#bin/bash


# docker run -p 3000:3000 -v $PWD:/wd tschachn/se-scraper:latest 
#See: https://github.com/NikolaiT/se-scraper



for ENGINE in "google" "duckduckgo" "bing"

do
    echo 'working with engine: '$ENGINE '...'
    curl -XPOST http://0.0.0.0:3000 -H 'Content-Type: application/json' \
    -d "{
        \"browser_config\": {
            \"random_user_agent\": true
        },
        \"scrape_config\": {
            \"search_engine\": \"${ENGINE}\",
            \"keywords\": [\"job offer acceptance\"],
            \"num_pages\": 60
        }
    }" >  "../wd/examples/accept/${ENGINE}.json"
done