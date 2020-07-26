# Check if the website is up
curl -sSf http://localhost:8080 > /dev/null

if [ $? != 0 ]; then
    echo "Down. Restarting rest..."
    docker restart rest
else
    echo "Up"
fi
