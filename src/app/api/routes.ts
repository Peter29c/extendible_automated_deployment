import { FastifyInstance } from 'fastify';

import { registerHealthRoutes } from '../../modules/health/interface/http';
import { registerMetricsRoutes } from '../../modules/metrics/interface/http';

export async function registerRoutes(app: FastifyInstance): Promise<void> {
  await app.register(registerHealthRoutes, {
    prefix: '/health',
  });

  await app.register(registerMetricsRoutes, {
    prefix: '/metrics',
  });
}
