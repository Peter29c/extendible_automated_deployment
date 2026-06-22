import Fastify, { FastifyInstance } from 'fastify';

import { healthRoutes } from './modules/health';
import { metricsRoutes } from './modules/metrics';

export class AppFactory {
  public static build(): FastifyInstance {
    const app = Fastify({
      logger: true,
    });

    app.register(healthRoutes);
    app.register(metricsRoutes);

    return app;
  }
}
