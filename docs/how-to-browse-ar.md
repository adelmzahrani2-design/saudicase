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

## تصفح النسخة الأولية قبل النشر (الطريقة الأسرع)
من جذر المشروع:

```bash
./run-preview.sh
```

ثم افتح مباشرة:
`http://localhost:8080/web/index.html`

> إذا أردت منفذ مختلف: `./run-preview.sh 9090`
