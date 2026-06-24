import Fastify, { FastifyInstance } from 'fastify';

import { registerRoutes } from './routes';

export class AppFactory {
  public static async build(): Promise<FastifyInstance> {
    const app = Fastify({
      logger: true,
    });

    await registerRoutes(app);

    return app;
  }
}
