docker build -t course .
docker run -it --rm course bundle exec rake test
docker run -it -p 3000:3000 -v $(pwd):/app course
docker exec -it kind_wilbur bash