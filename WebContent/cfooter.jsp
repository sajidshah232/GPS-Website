<div class="footer">
    <div class="row">
        <div class="col-sm-3 p-4">
            <div class=" span_1_of_4" style="width:100%">
            <h4>Information</h4>
                <ul>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Customer Service</a></li>
                    <li><a href="#"><span>Advanced Search</span></a></li>
                    <li><a href="#">Orders and Returns</a></li>
                    <li><a href="#"><span>Contact Us</span></a></li>
                </ul>
            </div>
        </div>
        
        <div class="col-sm-3 p-4">
            <div class=" span_1_of_4" style="width:100%">
            <h4>Why buy from us</h4>
                <ul>
                    <li><a href="about.html">About Us</a></li>
                    <li><a href="faq.html">Customer Service</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="contact.html"><span>Site Map</span></a></li>
                    <li><a href="preview-2.html"><span>Search Terms</span></a></li>
                </ul>
            </div>
        </div>
        <div class="col-sm-3 p-4">
            <div class=" span_1_of_4" style="width:100%">
            <h4>My account</h4>
                <ul>
                    <li><a href="contact.html">Sign In</a></li>
                    <li><a href="index.jsp">View Cart</a></li>
                    <li><a href="#">My Wishlist</a></li>
                    <li><a href="#">Track My Order</a></li>
                    <li><a href="faq.html">Help</a></li>
                </ul>
            </div>
        </div>
        <div class="col-sm-3 p-4">
            <div class=" span_1_of_4" style="width:100%">
            <h4>Contact</h4>
                <ul>
                    <li><span>+60-9811763737</span></li>
                    <li><span>+60-8053431608</span></li>
                </ul>
                <div class="social-icons">
                    <h4>Follow Us</h4>
                    <ul>
                        <li class="facebook"><a href="#" target="_blank"> </a></li>
                        <li class="twitter"><a href="#" target="_blank"> </a></li>
                        <li class="googleplus"><a href="#" target="_blank"> </a></li>
                        <li class="contact"><a href="#" target="_blank"> </a></li>
                        <div class="clear"></div>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        /*
         var defaults = {
         containerID: 'toTop', // fading element id
         containerHoverID: 'toTopHover', // fading element hover id
         scrollSpeed: 1200,
         easingType: 'linear' 
         };
         */

        $().UItoTop({easingType: 'easeOutQuart'});

    });
</script>
<a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
<link href="css/flexslider.css" rel='stylesheet' type='text/css' />
<script defer src="js/jquery.flexslider.js"></script>
<script type="text/javascript">
    $(function () {
        SyntaxHighlighter.all();
    });
    $(window).load(function () {
        $('.flexslider').flexslider({
            animation: "slide",
            start: function (slider) {
                $('body').removeClass('loading');
            }
        });
    });
</script>
</body>
</html>