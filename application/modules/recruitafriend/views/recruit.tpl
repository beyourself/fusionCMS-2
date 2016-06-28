<section id="statistics_wrapper">
    <section id="statistics">
        <section id="raf_titles">
            <h3>Welcome to the Recruit a Friend system!</h3>
        </section>
        <p>
        <font color="6ABD12">What are the rewards?</font>
        <p>
        <font color="A07332">The current reward you get for recruiting your friends are donation points! Regularly you get 2 donation points for every validated recruit!</font>
        <p>
        <font color="BD4515"><p style="text-indent: 13px;">Caution! Exclusively during the Beta phase of the project, you get + 1 donation point for every validated recruit!</p>
        <p style="text-indent: 13px;"> This means 3 donation points for every validated recruit in total!</p></font>
        <p>
        <font color="6ABD12">How does the system work?</font>
        <p>
        <font color="A07332">The Recruit a Friend system is as simple as:</font>
        <p>
        <font color="50BF00">A:</font> <font color="A07332">Give your friends your unique recruiter link found below.</font>
        <input type="text" class="" value="{$ref_url}" onclick="this.focus(); this.select();" readonly style="color: #50BF00;"/></p>
        <p>
        <font color="50BF00">B:</font> <font color="A07332">They must register their account using the unique recruiter link you provided for them. Once they do, you will be able to track the status of your referral below.</font>
        <p>
        <font color="50BF00">C:</font> <font color="A07332">Once your friends reach 6 hours play time in-game they will become validated and you will be able to redeem your rewards below!</font>
        <p>
        <section id="raf_titles">
        <h3>Review your friends status below:</h3>
        </section>
        <p>
        <section class="raf_table" style="display:block;">
            {if $accounts}
            <table class="nice_table" cellspacing="0" cellpadding="0">
                <tr>
                    <td>Account</td>
                    <td>Status</td>
                </tr>
                <br>
                {foreach from=$accounts item=num}
                <tr>
                <td><a href="{$base_url}profile/{$num['id']}">{$num['username']}</a></td><td>
                    {if $num['canClaim'] == 1}
                <a style="color:0CB3FB; text-decoration:none;" href="{$base_url}recruitafriend/claim/{$num['id']}">Claim your rewards now!</a></td>
                    {elseif $num['canClaim'] == 0}
                <span style="color:red">Recruit is false. Rewards unavailable.</span></td>
                    {elseif $num['canClaim'] == 2}
                <span style="color:green">Rewards has successfully been claimed.</span></td>
                    {elseif $num['canClaim'] == 3}
                <span style="color:#F2E707;">Play time requirement not yet met!</span></td>
                    {elseif $num['canClaim'] == 4}
                <span style="color:red">Error, please contact the team!</span></td>
                    {/if}
                </tr>
                {/foreach}
            </table>
            {else}
            <br/>
            <p><font color="C84900">Sorry, no referrals to display here, you have not recruited any of your friends yet!</font></p>
            {/if}
        </section>
    </section>
</section>