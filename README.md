# Search Engine Scraper

Shell script that uses the Javascript module  [se-scraper](https://github.com/NikolaiT/se-scraper)

The examples folder has the results of searching "job offer acceptance" and "job offer decline".

To customize your searches modify the *keywords* values in the *scrape_config* object in `run.sh`. To store your results, change the name of the directory that appears after the sign ">" in `run.sh`.

The `run.sh` is:

```bash
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
```
