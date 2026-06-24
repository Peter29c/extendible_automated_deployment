import { describe, expect, it } from 'vitest';
import client from 'prom-client';

import { AppFactory } from '../../src/app/api/app';

describe('Metrics Endpoint', () => {
  it('should return status ok', async () => {
    const app = await AppFactory.build();

    const response = await app.inject({
      method: 'GET',
      url: '/metrics',
    });

    expect(response.statusCode).toBe(200);

    expect(response.headers['content-type']).toBe(client.register.contentType);

    expect(response.body).toContain('# HELP');
  });
});
