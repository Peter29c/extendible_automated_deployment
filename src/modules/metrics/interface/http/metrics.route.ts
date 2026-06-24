import { FastifyInstance } from 'fastify';

import { MetricsService } from '../../application/index';
import { MetricsController } from './index';

export async function registerMetricsRoutes(
  app: FastifyInstance,
): Promise<void> {
  const metricsService = new MetricsService();
  const metricsController = new MetricsController(metricsService);

  app.get('/', metricsController.check.bind(metricsController));
}
