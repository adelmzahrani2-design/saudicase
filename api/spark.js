/**
 * Example serverless proxy for spark generation.
 * Moves AI key usage from browser to server.
 */
export default async function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method Not Allowed' });
  }

  const { content, sourceName = 'unknown', level = 1 } = req.body || {};

  if (!content || typeof content !== 'string') {
    return res.status(400).json({ error: 'content is required' });
  }

  try {
    const aiResponse = await fetch('https://api.anthropic.com/v1/messages', {
      method: 'POST',
      headers: {
        'x-api-key': process.env.ANTHROPIC_API_KEY,
        'Content-Type': 'application/json',
        'anthropic-version': '2023-06-01'
      },
      body: JSON.stringify({
        model: 'claude-sonnet-4-20250514',
        max_tokens: 1000,
        messages: [
          {
            role: 'user',
            content: `حوّل هذا المحتوى إلى شرارة تعليمية عربية واضحة.\nالمصدر: ${sourceName}\nالمستوى: ${level}\nالنص: ${content}`
          }
        ]
      })
    });

    if (!aiResponse.ok) {
      const err = await aiResponse.text();
      return res.status(aiResponse.status).json({ error: err });
    }

    const payload = await aiResponse.json();
    return res.status(200).json(payload);
  } catch (error) {
    return res.status(500).json({ error: 'Upstream AI request failed', details: String(error) });
  }
}
