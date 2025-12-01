# Twinkle Tails – Kids Glow Garden Prototype

Twinkle Tails is a very simple, ad-free, offline-only Flutter app for children aged 4–6.  
The app has **one main menu** and **three tiny replayable activities**:

- **Glow Garden** – tap flowers to grow them from seed → sprout → glowing flower
- **Colour Mix** – tap color blobs to mix colors in a glowing pond
- **Sky Bubbles** – tap bubbles to pop / fade them with sparkles
- **Goodnight** – a calm “goodnight” screen to end the session

All logic is contained in a single file:

- `main.dart` – complete working prototype (no backend, no plugins)

---

## What a developer needs to do

This repository intentionally contains only `main.dart` and a simple GitHub Actions experiment.  
To produce a proper **release-signed Android App Bundle (.aab)** suitable for Google Play, please:

1. **Create a new Flutter app locally**

   ```bash
   flutter create twinkletails_app
   cd twinkletails_app
