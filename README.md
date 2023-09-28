## Instructions for building & run the docker container for ontology detail

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/usmansohee/ontology-lookup.git

2. **Navigate to the Project Directory**:

   Change your current directory to the project folder:

   ```bash
   cd ontology-lookup
   
3. **Build the Docker Image:**

    Use following Docker cmd to build the container image.
    ```bash
    docker build -t ontology-lookup .
   
4. **Run Docker image:**

    Once the image is built, run it with the following command
    ```bash
    docker run -it ontology-lookup <ontology_id>
   
5. **Example <ontology_ids> for test:**

    ```bash
    agro
    rs
    sbo
