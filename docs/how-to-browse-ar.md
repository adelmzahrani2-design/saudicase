# كيف أتصفح المنصة؟

## رابط مباشر جاهز بعد النشر
بعد نشر المشروع على Vercel سيكون الرابط المباشر مثل:
`https://manarah-yourname.vercel.app`

> ملاحظة: لا يمكنني إنشاء رابط عام ثابت من داخل بيئة التطوير هذه بدون حساب النشر الخاص بك.

## تشغيل محلي الآن
1. شغّل:
```bash
python3 -m http.server 8080
```
2. افتح:
`http://localhost:8080/web/index.html`

## تشغيل API الحقيقي
لاستخدام `/api/spark` فعلياً، شغّل عبر Vercel/Next.js مع متغير البيئة:
- `ANTHROPIC_API_KEY`
