package community;



public class SearchBean {
    private String searchType; // 검색 유형 (all, title, content)
    private String searchText; // 검색 텍스트

    // 생성자, Getter 및 Setter 메서드
    public SearchBean() {
    }

    public String getSearchType() {
        return searchType;
    }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }
}
