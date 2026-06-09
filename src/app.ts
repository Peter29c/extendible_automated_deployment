import Fastify from 'fastify';

import { healthRoutes } from './modules/health';

export const buildApp = () => {
  const app = Fastify({
    logger: true,
  });

  app.register(healthRoutes);

  return app;
};
