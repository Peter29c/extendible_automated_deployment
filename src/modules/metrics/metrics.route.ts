import { FastifyInstance, FastifyPluginAsync } from 'fastify';
import client from 'prom-client';

const register = new client.Registry();

client.collectDefaultMetrics({ register });

export const metricsRoutes: FastifyPluginAsync = async (
  app: FastifyInstance,
) => {
  app.get('/metrics', async (_request, reply) => {
    reply.type(register.contentType);

    return register.metrics();
  });
};
