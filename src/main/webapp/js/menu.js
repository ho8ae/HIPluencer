function goForum(){
    location.href="../community/free.jsp";
}

function fromMaingoForum(){
    location.href="../view/community/free.jsp";
}


function goForumWrite(){
    location.href="../community/write.jsp";
}

function goShareForum(){
    location.href="../community/share.jsp";
}
function fromMaingoShareForum(){
    location.href="../view/community/share.jsp";
}

function goShareForumWrite(){
    location.href="../community/shareWrite.jsp";
}

function goReviewForum(){
    location.href="./community/share.jsp";
    
}

function goHotForum(){
    location.href="./community/free.jsp";
}

function goReviewForumWrite(){
    location.href= "/community/review/shareWrite.jsp";
}

function goRecipeForumWrite(){
    location.href="/community/recipe/write";
}
function goWorldCup(){
    location.href="/worldcup";
}


function goForumList() {
	console.log("Button clicked");
    location.href= "../community/free.jsp";
}

function goForumShareList() {
	console.log("Button clicked");
    location.href= "../community/share.jsp";
}

function goRankingTable(id){
    location.href= "/worldcup/rank/" + id;
}

function makeBackUrl() {
    cookieUtil.setCookieWithExpire("listBtnUrl", encodeURIComponent(location.href), 1);
}

function validateSearch(){
    var keyword = $("#searchInput").val();

    if(keyword.length < 1){
        alert("검색어를 입력해주세요.");
        return false;
    }

    return true;
}