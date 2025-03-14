<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cab Booking - Explore Sri Lanka</title>
    <link rel="stylesheet" href="styles.css">
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #222;
            color: white;
        }

        .hero {
            position: relative;
            width: 100%;
            height: 630px;
            background: url("${pageContext.request.contextPath}/role/customer/images/texi1.jpg") center/cover no-repeat;
            display: flex;
            align-items: center;
            padding: 0 5%;
        }

        .overlay {
            position: absolute;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            top: 0;
            left: 0;
        }

        .content {
            position: relative;
            z-index: 2;
            max-width: 500px;
        }

        .content h4 {
            font-size: 18px;
            color: #fff;
        }

        .content h1 {
            font-size: 60px;
            font-weight: bold;
            margin: 10px 0;
        }

        .content p {
            font-size: 16px;
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            padding: 12px 25px;
            background: transparent;
            border: 2px solid white;
            color: white;
            text-decoration: none;
            font-size: 18px;
        }

        .car-image img {
            position: absolute;
            right: 10%;
            bottom: 10%;
            width: 400px;
            z-index: 2;
        }

        .whatsapp {
            position: fixed;
            bottom: 20px;
            right: 20px;
        }

        .whatsapp img {
            width: 50px;
        }

        .faq-section {
            background-color: black;
            padding: 60px 20px;
            display: flex;
            justify-content: center;
        }

        .faq-box {
            max-width: 800px;
            width: 100%;
        }

        .faq-box h2 {
            font-size: 36px;
            color: #FFC107;
            text-align: center;
            margin-bottom: 10px;
        }

        .faq-subtitle {
            text-align: center;
            color: #cccccc;
            margin-bottom: 30px;
            font-size: 16px;
        }

        .faq-item {
            background-color: #eceff4;
            border-radius: 10px;
            margin-bottom: 15px;
            overflow: hidden;
            transition: all 0.3s ease;
            box-shadow: 8px 4px 8px #FFC107;
        }

        .faq-question {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            cursor: pointer;
            color: #1a1a1a;
            font-weight: 600;
            font-size: 18px;
        }

        .faq-icon {
            transition: transform 0.3s ease;
        }

        .faq-item.active .faq-icon {
            transform: rotate(180deg);
        }

        .faq-answer {
            display: none;
            padding: 0 20px 20px 20px;
            color: #333333;
            font-size: 16px;
            line-height: 1.5;
        }

        .faq-item.active .faq-answer {
            display: block;
        }

        /* Customer Services Section */
        .services-section {
            background-color: black;
            padding: 60px 20px;
            color: #1a1a1a;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .services-section h2 {
            font-size: 45px;
            color: white;
            text-align: center;
            margin-bottom: 10px;
        }

        .services-section p {
            text-align: center;
            color: #666;
            margin-bottom: 40px;
            font-size: 16px;
        }

        .services-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .service-card {
            background-color: #eef2f7;
            border-radius: 12px;
            padding: 30px 20px;
            width: 300px;
            display: flex;
            flex-direction: column;
            align-items: start;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }

        .service-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0,0,0,0.15);
        }

        .service-icon {
            width: 50px;
            height: 50px;
            background-color: black;
            color: #ffc107;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .service-card h3 {
            margin-bottom: 10px;
            color: #1a1a1a;
            font-size: 20px;
        }

        .service-card p {
            font-size: 14px;
            color: #444;
        }
        

    </style>
</head>
<body>
<jsp:include page="/role/customer/jsp/header.jsp" />

<section class="hero">
    <div class="overlay"></div>
    <div class="content">
        <h4>Most Trusted Cab</h4>
        <h1>EXPLORE SRI LANKA WITH EASE<span class="dot">.</span></h1>
        <p>Book your perfect ride today and embark on a journey of comfort and convenience</p>
        <a href="" class="btn">Book Now</a>
    </div>
</section>



<!-- Customer Services Section Start -->
<section class="services-section">
    <h2>Our <strong style="color:#ffc107;">Customer Services</strong></h2>
    <p>Here to help You Every Step of the Way</p>

    <div class="services-container">

        <div class="service-card">
            <div class="service-icon">💬</div>
            <h3>Customer Support</h3>
            <p>Our dedicated Customer Support team is here to assist you with any questions or concerns. Whether you need help with bookings, account management, or general inquiries, reach out to us anytime. We’re committed to ensuring you have a smooth and enjoyable experience with Kangaroo Cabs.</p>
        </div>

        <div class="service-card">
            <div class="service-icon">📝</div>
            <h3>Feedback</h3>
            <p>We value your input! Share your thoughts and suggestions about your experience with us. Your feedback helps us improve our services and better meet your needs. Whether it’s a compliment or a constructive suggestion, we’d love to hear from you!</p>
        </div>

        <div class="service-card">
            <div class="service-icon">❓</div>
            <h3>Inquiries</h3>
            <p>Have a question or need more information? Our team is ready to help! Whether you’re looking for details about our services, pricing, or anything else, don’t hesitate to contact us. We’re here to provide you with all the information you need for a hassle-free journey.</p>
        </div>

    </div>
</section>
<!-- Customer Services Section End -->

<!-- FAQs Section Start -->
<section class="faq-section">
    <div class="faq-box">
        <h2>FAQs</h2>
        <p class="faq-subtitle">Discover more information about Kangaroo Cabs for Your Travel</p>

        <div class="faq-item">
            <div class="faq-question">
                <span>How do I book a ride ?</span>
                <span class="faq-icon">▼</span>
            </div>
            <div class="faq-answer">
                <p>You can book a ride via our app, website, or by calling our hotline. Simply enter your pickup and drop-off details, select your vehicle, and confirm.</p>
            </div>
        </div>

        <div class="faq-item">
            <div class="faq-question">
                <span>Is there a customer support service available 24/7 ?</span>
                <span class="faq-icon">▼</span>
            </div>
            <div class="faq-answer">
                <p>Yes, our customer support is available 24/7 through our hotline and WhatsApp.</p>
            </div>
        </div>

        <div class="faq-item">
            <div class="faq-question">
                <span>How can I provide feedback about my experience with Kangaroo Cabs ?</span>
                <span class="faq-icon">▼</span>
            </div>
            <div class="faq-answer">
                <p>You can provide feedback via our app, website, or email us directly at feedback@kangaroocabs.com.</p>
            </div>
        </div>

        <div class="faq-item">
            <div class="faq-question">
                <span>What areas does Kangaroo Cabs operate in ?</span>
                <span class="faq-icon">▼</span>
            </div>
            <div class="faq-answer">
                <p>We provide services across Sri Lanka, including Colombo, Kandy, Galle, and more, as well as airport transfers to all international airports.</p>
            </div>
        </div>
    </div>
</section>
<!-- FAQs Section End -->
<!-- Footer Section Start -->
<footer style="background-color: #111; color: #fff; padding: 60px 20px 30px;">
    <div style="max-width: 1200px; margin: 0 auto; display: flex; flex-wrap: wrap; justify-content: space-between; align-items: flex-start; gap: 30px;">
        
        <!-- Company Info -->
        <div style="flex: 1 1 280px;">
            <h3 style="color: #ffc107; font-size: 28px; margin-bottom: 15px;">MEGA CITY CAB</h3>
            <p style="color: #ccc; line-height: 1.6;">Your trusted travel partner across Sri Lanka. We offer reliable, safe, and affordable rides, making your journey comfortable and convenient.</p>
        </div>

        <!-- Contact Info -->
        <div style="flex: 1 1 280px;">
            <h4 style="color: #ffc107; margin-bottom: 15px;">Contact Us</h4>
            <ul style="list-style: none; padding: 0; color: #ccc;">
                <li style="margin-bottom: 10px;">
                    <span style="margin-right: 10px;">📞</span> <strong>Hotline:</strong> (074) 3814222
                </li>
                <li style="margin-bottom: 10px;">
                    <span style="margin-right: 10px;">📧</span> <strong>Email:</strong> info@megacitycab.com
                </li>
                <li style="margin-bottom: 10px;">
                    <span style="margin-right: 10px;">🏢</span> <strong>Address:</strong> 123, Main Street, Colombo, Sri Lanka
                </li>
            </ul>
        </div>

        <!-- Social Media & Newsletter -->
        <div style="flex: 1 1 280px;">
            <h4 style="color: #ffc107; margin-bottom: 15px;">Follow Us</h4>
            <div style="display: flex; gap: 15px; margin-bottom: 20px;">
                <a href="#" style="display: inline-flex; align-items: center; justify-content: center; background: #ffffff; color: #111; width: 40px; height: 40px; border-radius: 50%; transition: 0.3s;">
                    <img src="${pageContext.request.contextPath}/images/facebook.jpg" alt="Facebook" style="width: 20px;">
                </a>
                <a href="#" style="display: inline-flex; align-items: center; justify-content: center; background: #ffffff; color: #111; width: 40px; height: 40px; border-radius: 50%; transition: 0.3s;">
                    <img src="${pageContext.request.contextPath}/images/instagram.jpg" alt="Instagram" style="width: 20px;">
                </a>
                <a href="#" style="display: inline-flex; align-items: center; justify-content: center; background: #ffffff; color: #111; width: 40px; height: 40px; border-radius: 50%; transition: 0.3s;">
                    <img src="${pageContext.request.contextPath}/images/twitter.jpg" alt="Twitter" style="width: 20px;">
                </a>
            </div>

            <!-- Newsletter -->
            <h4 style="color: #ffc107; margin-bottom: 10px;">Subscribe</h4>
            <form style="display: flex;">
                <input type="email" placeholder="Your email" style="flex: 1; padding: 10px; border: none; border-radius: 5px 0 0 5px;">
                <button type="submit" style="background-color: #ffc107; color: #111; border: none; padding: 10px 20px; border-radius: 0 5px 5px 0; cursor: pointer;">Join</button>
            </form>
        </div>

    </div>

    <!-- Divider -->
    <div style="border-top: 1px solid #333; margin-top: 40px; padding-top: 20px; text-align: center; color: #555;">
        © 2025 <strong style="color: #ffc107;">Mega City Cab</strong>. All Rights Reserved.
    </div>
</footer>
<!-- Footer Section End -->


<script>
document.addEventListener('DOMContentLoaded', function() {
    const faqItems = document.querySelectorAll('.faq-item');

    faqItems.forEach(item => {
        const question = item.querySelector('.faq-question');

        question.addEventListener('click', () => {
            item.classList.toggle('active');
        });
    });
});
</script>

</body>
</html>