import * as dotenv from 'dotenv';

import { AppFactory } from './app';

dotenv.config();

const app = new AppFactory().build();

const start = async () => {
  try {
    await app.listen({
      host: String(process.env.SERVER_URL),
      port: Number(process.env.PORT),
    });
  } catch (error) {
    app.log.error(error);

    process.exit(1);
  }
};

start();
