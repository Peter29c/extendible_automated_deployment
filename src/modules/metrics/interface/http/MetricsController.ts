import { FastifyReply, FastifyRequest } from 'fastify';
import client from 'prom-client';

import { MetricsService } from '../../application/index';

export class MetricsController {
  constructor(private readonly metricsService: MetricsService) {}

  async check(request: FastifyRequest, reply: FastifyReply): Promise<void> {
    reply.type(client.register.contentType);

    try {
      const metrics = await this.metricsService.check();

      return reply.status(200).send(metrics);
    } catch (error) {
      console.log('metrics error:', error);

      request.log.error(error);
      reply.status(500).send({ error: 'Metrics internal error' });
    }
  }
}
