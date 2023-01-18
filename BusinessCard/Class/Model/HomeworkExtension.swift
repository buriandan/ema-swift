extension HomeworkState {
    var backgroundColor: String {
        switch (self) {
            case .acceptance: return "TaskBackgroundAcceptance"
            case .review: return "TaskBackground"
            case .push: return "TaskBackground"
            case .comingsoon: return "TaskBackground"
            case .ready: return "TaskBackground"
        }
    }
}
