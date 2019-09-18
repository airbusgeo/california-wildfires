# california-wildfire

Jupyter notebook (python) to present One Atlas Data API.

- Find image with opensearch
- Get his wmts template to map it

Jupyter service is running into a **docker container** and it provide an access in browser

## Configuration

To use one atlas data api in the notebook, you need an api key.

Get it on https://data.api.oneatlas.airbus.com/api-keys, download the `api_key.txt` and paste it into the folder.

### Build docker image

Build image only once (run command in this folder).

`docker build -t one_atlas_data_jupyter .`

### Start jupyter service

Run docker container to start jupyter notebook service (run command in this folder too).

`docker run --rm -it -v $(pwd):/home -p 80:80 one_atlas_data_jupyter`

### Access on browser

http://localhost/lab

## External link

- [Docker](https://www.docker.com/)
- [Jupyter](https://jupyter.org/)
- [One Atlas Data API](https://tceife2-idp-prod-oneatlasdata.appspot.com/api-catalog/oneatlas-data/index.html)
- [One Atlas Data Tutorial](https://tceife2-idp-prod-oneatlasdata.appspot.com/tutorials/t-california-wildfire/)
