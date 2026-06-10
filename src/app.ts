import Fastify, { FastifyInstance } from 'fastify';

import { healthRoutes } from './modules/health';

export class AppFactory {
  public static build(): FastifyInstance {
    const app = Fastify({
      logger: true,
    });

    app.register(healthRoutes);

    return app;
  }
}
