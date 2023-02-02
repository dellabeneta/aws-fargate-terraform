//Esse código é TOTALMENTE baseado na aplicação do Cleber Gasparoto.
//Que pode ser encontrada aqui: https://github.com/chgasparoto/youtube-cleber-gasparoto/tree/main/0007-aws-ecs-fargate/app
//Todos os créditos ao mesmo!


const express = require('express');
const axios = require('axios');

//const db = require('./db');

const app = express();
const port = 3000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const indexPage = `
    <h2>AWS ECS Fargate</h2>
    <h3>Aplicação feita em NodeJS com backend em Containers usando AWS ECS e Fargate. 
    <p>De qual animal quer obter uma foto alatória?</p>
    <ul>
        <li>Cahorros? <a href="/dogs">Clique aqui</a></li>
        <li>Gatos? <a href="/cats">Clique aqui</a></li>
    </h3></ul>
`;

app.get('/', (req, res) => res.send(indexPage));
app.get('/healthcheck', (req, res) => {
  try {
    res.sendStatus(204);
  } catch (error) {
    res.sendStatus(500);
  }
});

app.get('/dogs', async (req, res) => {
  try {
    const response = await axios.get('https://dog.ceo/api/breeds/image/random');

    console.log(JSON.stringify(response.data));

    const { message: dogImage } = response.data;
    res.send(
      `<img src="${dogImage}" alt="random dog" style="max-width: 800px" />`
    );
  } catch (error) {
    console.error(JSON.stringify(error));
    res.status(500);
    res.send(error.message);
  }
});

app.get('/cats', async (req, res) => {
  try {
    const response = await axios.get('https://aws.random.cat/meow');

    console.log(JSON.stringify(response.data));

    const { file: catImage } = response.data;
    res.send(
      `<img src="${catImage}" alt="random cat" style="max-width: 800px" />`
    );
  } catch (error) {
    console.error(JSON.stringify(error));
    res.status(500);
    res.send(error.message);
  }
});

app.listen(port, () => {
  console.log(`App running on port ${port}`);
});