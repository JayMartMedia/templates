import express from 'express';
import morgan from 'morgan';
import cors from 'cors';
import { randomFromArray, randomInRange } from './random';

// setup and configure express
const app = express();
const port = 3001;

const allowedOrigins: string[] = [
    'http://localhost:3000'
];

app.use(express.json());
app.use(morgan('short'));
app.use(express.static('public'));
app.use(cors({
    origin: allowedOrigins
}));

// setup routes
app.get('/helloworld', (req: express.Request, res: express.Response) => {
  res.send({ hello: "world" });
});

app.get('/rolldice', (req: express.Request, res: express.Response) => {
  const dice = [randomInRange(1,6), randomInRange(1,6)];
  const total = dice.reduce((acc, cur) => {
    return acc + cur;
  });
  res.send({dice: dice, total: total});
});

const cards = [2,3,4,5,6,7,8,9,10,'J','Q','K','A'];
const suites = ['♠','♥','♣','♦'];
app.get('/drawcard', (req: express.Request, res: express.Response) => {
  const card = randomFromArray(cards);
  const suite = randomFromArray(suites);
  res.send({ result: `${card}${suite}` });
});

// start express
app.listen(port, () => {
  console.log(`App listening on port: ${port}`);
});