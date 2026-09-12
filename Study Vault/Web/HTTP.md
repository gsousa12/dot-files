**HTTP** is a client-server, application-layer protocol (sent over TCP/TLS) that powers data exchange on the Web. Clients (typically browsers) initiate **requests**; servers send back **responses**.

**Key components:**

- **Client (user-agent):** Usually the browser — fetches HTML, then additional resources (CSS, scripts, images/videos) to render a page.
- **Server:** Serves requested documents; may be a cluster of machines using load balancing, caches, or databases behind the scenes.
- **[[Proxy]]:** Intermediaries at the application layer that can handle:
    - Caching, filtering, load balancing, authentication, and logging.

**HTTP Requests** have three parts:

- **Method (verb):** Indicates the intended action — e.g., `GET` (retrieve data) or `POST` (submit data).
- **Headers:** Key-value pairs communicating metadata (browser type, data requested, etc.).
- **Body:** The actual data being sent (e.g., form inputs like username/password).

**HTTP Responses** also have three parts:

- **Status code:** 3-digit code indicating the result:
    - `1xx` – Informational
    - `2xx` – Success (e.g., `200 OK`)
    - `3xx` – Redirect
    - `4xx` – Client error (e.g., `404 Not Found`)
    - `5xx` – Server error
- **Headers:** Metadata about the response (language, format, etc.).
- **Body:** The returned content — typically HTML for `GET` requests.


**HTTPS = HTTP + TLS encryption & authentication.**

### Encryption

HTTPS uses [[TLS]] / [[SSL]] with **public key cryptography**:

1. Server shares a **public key** via its SSL certificate.
2. Client and server negotiate **session keys** using the public/private key pair.
3. All requests/responses are encrypted with session keys — interceptors see only gibberish.

### Authentication

HTTP has **no identity verification** — it operates on implicit trust. HTTPS fixes this:

- The server's **private key** proves it legitimately owns the SSL certificate.
- The SSL certificate is **digitally signed** by a trusted Certificate Authority (CA).
- This blocks attacks like DNS hijacking, domain spoofing, and on-path attacks.