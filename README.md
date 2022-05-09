# Epoch Register Service     

  ### Docker Startup 
    docker build -t test_app .
    docker run -it --env-file .env -p 8000:8000 test_app

  ### App Use
    curl -X POST localhost:8000/epoch/
    curl -X GET localhost:8000/epoch/{ID_FROM_POST_RESPONSE}

    docker run -d  --rm  -p 8080:8080 -p 50000:50000 -p 22:22 -v jenkins_home:/var/jenkins_home jenkins/jenkins:latest