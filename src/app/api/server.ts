import * as dotenv from 'dotenv';

import { AppFactory } from './app';
import { FastifyInstance } from 'fastify';

dotenv.config();

const start = async (): Promise<void> => {
  const app: FastifyInstance = await AppFactory.build();

  try {
    await app.listen({
      host: process.env.SERVER_URL || '0.0.0.0',
      port: Number(process.env.PORT) || 3000,
    });
  } catch (error) {
    app.log.error(error);

    process.exit(1);
  }
};

start();
