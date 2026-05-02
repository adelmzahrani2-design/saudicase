# خطة التنفيذ التفصيلية (Prototype → Live)

## Sprint 0 (3 أيام)
- تجهيز مستودع وبيئات (dev/stage/prod).
- ربط Vercel + Supabase + Stripe + مزود AI.
- تعريف Secrets وسياسات الوصول.

## Sprint 1–2 (الأسبوع 1–2)
- إطلاق `/api/spark` مع rate limiting.
- ربط تسجيل الدخول OTP.
- بناء ingestion service للأخبار.
- تفعيل ticker حي من DB.

**مؤشرات نجاح:**
- زمن توليد شرارة < 4 ثوانٍ (P50).
- نسبة أخطاء API أقل من 2%.

## Sprint 3–5 (الأسبوع 3–6)
- Partner CMS + إدارة المحتوى.
- Event tracking كامل.
- Notifications (push/email).
- Stripe onboarding.

**مؤشرات نجاح:**
- 3 شركاء تجريبيين مفعلين.
- 500 حدث شرارة موثق يومياً.

## Sprint 6–10 (الأسبوع 7–12)
- توليد شرارات استباقي.
- صفحات مشاركة + Open Graph.
- SEO programmatic pages.
- لوحات تحليلات متقدمة.

**مؤشرات نجاح:**
- نمو عضوي 20% شهرياً.
- وقت بقاء المستخدم +30%.
